import json

json_dict_string = '{"name": "John", "age": 30, "city": "New York"}'
json_list_string = '[1, 2, 3, 4, 5]'
json_another_dict_string = '{"name": "Alice", "age": 25, "city": "London"}'
json_another_list_string = '[6, 7, 8, 9, 10]'

list_of_dicts = []
list_of_lists = []

json_strings = [json_dict_string, json_list_string, json_another_dict_string, json_another_list_string]

for json_string in json_strings:
    python_dict = json.loads(json_string)
    if isinstance(python_dict, dict):
        list_of_dicts.append(python_dict)
    else:
        list_of_lists.append(python_dict)

print("List of Dictionaries:", list_of_dicts)
print("List of Lists:", list_of_lists)
