#include <functional>
#include <iostream>
#include <string>
#include <termios.h>
#include <sstream>
#include <iomanip>
#include <openssl/sha.h>

void hidePassword(char* password) {
    struct termios orig_term, new_term;
    tcgetattr(0, &orig_term);
    new_term = orig_term;
    new_term.c_lflag &= ~ECHO;  // Turn off echo
    tcsetattr(0, TCSANOW, &new_term);

    std::cout << "Introduceți parola: ";
    int i = 0;
    while (true) {
        char ch = std::cin.get();
        if (ch == '\n') {
            break;
        }
        password[i++] = ch;
        std::cout << '*';  // Replace each character with '*'
    }
    password[i] = '\0';

    tcsetattr(0, TCSANOW, &orig_term);
}

int main() {
    std::string hashPass = "54bdc049d97f97d64d3c401bd6febca9b7a89990b2a7b7b215031dcb147a3b4a"; //the_secret_password_is = "54bdc049d97f97d64d3c401bd6febca9b7a89990b2a7b7b215031dcb147a3b4a"
    char password[100];  
    hidePassword(password);
    std::cout << std::endl;
    std::string data = password;
    // Calcularea hash-ului SHA-256
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256_CTX sha256;
    SHA256_Init(&sha256);
    SHA256_Update(&sha256, data.c_str(), data.length());
    SHA256_Final(hash, &sha256);

    // Salvarea valorii hash într-o variabilă de tip std::string
    std::stringstream ss;
    for (int i = 0; i < SHA256_DIGEST_LENGTH; ++i) {
        ss << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(hash[i]);
    }
    std::string hashValue = ss.str();

    // Afișarea valorii hash pentru debug
    //std::cout << "Hash SHA-256: " << hashValue << std::endl;

    
    if (hashValue == hashPass) {
        std::cout << "Parola este corectă!" << std::endl;
    } else {
        std::cout << "Parola este incorectă!" << std::endl;
    }

    return 0;
}
