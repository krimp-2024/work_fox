def add_name(name_list, name, to_upper=False):
    """
    Adds a name to the provided list with the first symbol in uppercase or all uppercase.

    Args:
        name_list (list): The list to add the name to.
        name (str): The name to add.
        to_upper (bool): If True, add the name in all uppercase. If False, capitalize the first letter.

    Returns:
        list: The updated list with the new name added.
    """
    try:
        if to_upper:
            name_list.append(name.upper())
        else:
            name_list.append(name.capitalize())
        return name_list
    except Exception as e:
        print(f"An error occurred: {e}")
        return name_list