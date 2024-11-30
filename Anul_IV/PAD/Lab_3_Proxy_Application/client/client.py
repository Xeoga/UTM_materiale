import requests
import json

def main():
    while True:
        print("\n--- Interactive Client ---")
        print("1. Send GET request")
        print("2. Send POST request")
        print("3. Exit")
        choice = input("Choose an option: ")

        if choice == "1":
            base_url = input("Enter the proxy URL (e.g., http://Proxy_App:5002): ")
            endpoint = "/employees"
            param_key = input("Enter the parameter key (e.g., id): ")
            param_value = input("Enter the parameter value: ")

            try:
                response = requests.get(f"{base_url}{endpoint}", params={param_key: param_value})
                if response.headers.get('Content-Type') == 'application/json':
                    print("\nJSON Response:", response.json())
                elif response.headers.get('Content-Type') == 'application/xml':
                    print("\nXML Response:", response.text)
                else:
                    print("\nResponse:", response.text)
            except requests.RequestException as e:
                print(f"\nError: {e}")

        elif choice == "2":
            base_url = input("Enter the proxy URL (e.g., http://Proxy_App:5002): ")
            endpoint = "/employees"
            data = {}

            while True:
                key = input("Enter the data key (or press Enter to finish): ")
                if not key:
                    break
                value = input(f"Enter the value for '{key}': ")
                data[key] = value

            try:
                response = requests.post(f"{base_url}{endpoint}", json=data)
                if response.headers.get('Content-Type') == 'application/json':
                    print("\nJSON Response:", response.json())
                else:
                    print("\nResponse:", response.text)
            except requests.RequestException as e:
                print(f"\nError: {e}")

        elif choice == "3":
            print("Exiting.")
            break

        else:
            print("Invalid option. Try again.")

if __name__ == "__main__":
    main()
