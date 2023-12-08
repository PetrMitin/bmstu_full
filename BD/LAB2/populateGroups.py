departments = ["77281351-6718-401e-a2f6-2adee08b9328",
"e8f3e003-f6f9-48b8-afee-7512230bb4b9",
"aaee9317-8093-4001-b5bc-3bc7d5a65e4d",
"9ab479a4-aae0-45fd-9065-b9d2cc7dbc6c",
"de3e5813-c2db-4935-b80d-cc95a5a88bcd",
"678bcc45-936d-443f-9923-9650d6ecdcd3",
"058ef629-cb9c-418c-b8aa-18e2a40dc3ba",
"2073c858-ae9b-4363-9d99-e0e7fc2cb084",
"2c5f9dbf-dc0f-4fd9-8543-044cabe5569d",
"d2e524dd-6bcc-4704-a422-86affe910bca"]
for i in range(len(departments)):
    department_id = departments[i]
    for j in range(5):
        name = f'Group{i * 10 + j}'
        field_of_study = f'Field of study {i * 10 + j}'
        print(f'(\'{department_id}\',\'{name}\', \'{field_of_study}\'),')
