import json

# Read your JSON data from the file
with open("countries.json", "r", encoding="utf-8") as file:
    data = json.load(file)

# Define a function to convert a key into a valid Dart variable name
def convert_key_to_dart(key):
    return key.replace(" ", "_").lower()

# Start creating the Dart List initialization
dart_class_code = "final List<Country> countriesList = [\n"

# Convert each country in the JSON to a Country object in Dart
for country in data:
    dart_class_code += "  Country(\n"
    for key, value in country.items():
        # Check if the value is a string and format accordingly
        if isinstance(value, str):
            dart_class_code += f"    {convert_key_to_dart(key)}: \"{value}\",\n"
        else:
            dart_class_code += f"    {convert_key_to_dart(key)}: {value},\n"
    dart_class_code = dart_class_code.rstrip(",\n")  # Remove trailing comma and newline
    dart_class_code += "\n  ),\n"

# Close the list and finish the Dart code
dart_class_code += "];\n"

# Write the Dart code to a file
with open("countries_list.dart", "w", encoding="utf-8") as dart_file:
    dart_file.write(dart_class_code)

print("Dart list of countries generated and saved to countries_list.dart")
