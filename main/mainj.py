from test import add_name

def main():
    names = []
    while True:
        name = input("Enter a name (or 'q' to quit): ")
        if name.lower() == 'q':
            break
        to_upper_input = input("Add in uppercase? (y/n): ").strip().lower()
        to_upper = to_upper_input == 'y'
        names = add_name(names, name, to_upper)
        print("Current names list:", names)

if __name__ == "__main__":
    main()