def main():
    print("main from script_with__name__ will not be run")
if __name__ == '__main__':
    print("Hello from the script with __name__")
    main()