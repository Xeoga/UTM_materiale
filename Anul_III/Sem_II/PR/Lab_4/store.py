import requests
import json

BASE_URL = "http://localhost:5000/"

def list_categories():
    url = f"{BASE_URL}/categories"
    response = requests.get(url)
    if response.ok:
        categories = json.loads(response.content)
        for category in categories:
            print(f"{category['id']}: {category['title']}")
    else:
        print(f"Error fetching categories: {response.status_code}")

def show_category(category_id):
    url = f"{BASE_URL}/categories/{category_id}"
    response = requests.get(url)
    if response.ok:
        category = json.loads(response.content)
        print(f"{category['title']} (ID: {category['id']})")
        print(category['description'])
    else:
        print(f"Error fetching category: {response.status_code}")

def create_category(title, description):
    url = f"{BASE_URL}/categories"
    data = {'title': title, 'description': description}
    response = requests.post(url, json=data)
    if response.ok:
        category = json.loads(response.content)
        print(f"Category created with ID: {category['id']}")
    else:
        print(f"Error creating category: {response.status_code}")

def delete_category(category_id):
    url = f"{BASE_URL}/categories/{category_id}"
    response = requests.delete(url)
    if response.ok:
        print("Category deleted")
    else:
        print(f"Error deleting category: {response.status_code}")

def change_category_title(category_id, new_title):
    url = f"{BASE_URL}/categories/{category_id}"
    data = {'title': new_title}
    response = requests.patch(url, json=data)
    if response.ok:
        print("Category title updated")
    else:
        print(f"Error updating category title: {response.status_code}")

def create_product(category_id, name, price, description):
    url = f"{BASE_URL}/categories/{category_id}/products"
    data = {'name': name, 'price': price, 'description': description}
    response = requests.post(url, json=data)
    if response.ok:
        product = json.loads(response.content)
        print(f"Product created with ID: {product['id']}")
    else:
        print(f"Error creating product: {response.status_code}")

def list_products(category_id):
    url = f"{BASE_URL}/categories/{category_id}/products"
    response = requests.get(url)
    if response.ok:
        products = json.loads(response.content)
        for product in products:
            print(f"{product['name']} (ID: {product['id']}, Price: {product['price']})")
            print(product['description'])
    else:
        print(f"Error fetching products: {response.status_code}")

while True:
    print("1. List categories")
    print("2. Show category details")
    print("3. Create a category")
    print("4. Delete a category")
    print("5. Change category title")
    print("6. Create a product")
    print("7. List products in a category")
    print("0. Exit")
    choice = input("Enter your choice: ")

    if choice == '1':
        list_categories()
    elif choice == '2':
        category_id = input("Enter category ID: ")
        show_category(category_id)
    elif choice == '3':
        title = input("Enter category title: ")
        description = input("Enter category description: ")
        create_category(title, description)
    elif choice == '4':
        category_id = input("Enter category ID: ")
        delete_category(category_id)
    elif choice == '5':
        category_id = input("Enter category ID: ")
        new_title = input("Enter new category title: ")
        change_category_title(category_id, new_title)
    elif choice == '6':
        category_id = input("Enter category ID: ")
        name = input("Enter product name: ")
        price = input("Enter product price: ")
        description = input("Enter product description: ")
        create_product(category_id, name, price, description)
    elif choice == '7':
        category_id = input("Enter category ID: ")
        list_products(category_id)
    elif choice == '0':
        break
    else:
        print("Invalid choice")
