import urllib.parse

def convert_special_chars_to_percent_encoding(input_string):
    output_string = ''.join(
        char if char.isalnum() or char == ' ' else '%' + format(ord(char), '02X')
        for char in input_string
    )
    
    return output_string

def decode_percent_encoded_string(encoded_string):
    return urllib.parse.unquote(encoded_string)

def encode_string_to_percent_encoding(input_string):
    return urllib.parse.quote(input_string)

def get_first_class_part(class_string):
    return class_string.split()[0]

def get_second_class_part(class_string):
    return  class_string.split()[1]

def get_last_id_part(category_id):
    return category_id.split('-')[-1]

def get_style_x_px(style_attribute):
    first = style_attribute.split('(')[-1]
    x = first.split()[0]
    number_string = x.split('p')[0]
    return float(number_string)

def get_style_height_px(style_attribute):
    first = style_attribute.split('height: ')[-1]
    string = first.split('p')[0]
    return float(string)

def text_to_number(text):
    return int(text)

def get_quota_num(text):
    quota = text.split()[5]
    return quota

def convert_date(day,month,year):
    date = str(year) + '-' + str(month) + '-' + str(day)
    return date