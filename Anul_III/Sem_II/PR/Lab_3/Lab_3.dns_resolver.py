import sys
import socket
import dns.resolver

def get_hostname(ip_address):
    try:
        hostname, _, _ = socket.gethostbyaddr(ip_address)
        return hostname
    except socket.herror as e:
        print(f"Nu sa gasit nimic:( {e}")
        return None
    
def get_ip_address(hostname):
    try:
        ip_address = socket.gethostbyname(hostname)
        return ip_address
    except socket.gaierror as e:
        print(f"Nu sa gasit nimic:( {e}")
        return None
    
def resolve_dns(domain_name, dns_server):
    resolver = dns.resolver.Resolver(configure=False)
    resolver.nameservers = [dns_server]
    try:
        answers = resolver.resolve(domain_name, 'A')
        for rdata in answers:
            print(f"{domain_name} are IP addresa: {rdata.address}")
    except dns.resolver.NoAnswer:
        print(f"Nu sa gasit nimic:( {domain_name}")
    except dns.resolver.NXDOMAIN:
        print(f"{domain_name} nu exista.")

if __name__ == '__main__':
    if sys.argv[1] == 'resolve':
        #resolve <domain> sau resolve <ip> care va afișa lista de ip adrese asignate
        #domeniului sau invers lista de domenii asignate la o ip adresa
        ip_dns = sys.argv[2] 
        try:
            socket.inet_aton(ip_dns)
            print(f'IP are DNS: {get_hostname(ip_dns)}')
        except socket.error:
            print(f'DNS este cunoscut cu denumirea: {get_ip_address(ip_dns)}')
    elif sys.argv[1] == 'use':
        #use dns <ip> - va schimba DNS server care va fi utilizat pentru comenzile din punctul precedent.
        prefer_dns =sys.argv[2]
        ip_dns = sys.argv[3]
        resolve_dns(ip_dns, prefer_dns)
        