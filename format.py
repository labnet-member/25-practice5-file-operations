def clean_data(data):
    data = [line.strip() for line in data if line.strip()]
    print("データ整形完了（clean_data内）:")
    for line in data:
        print("  -", line)
    return data

def save_data(data, output_path):
    with open(output_path, 'w', encoding='utf-8') as f:
        for line in data:
            f.write(line + '\n')
    print(f"{output_path} に保存しました。")

def main():
    input = "input.txt"
    output_path = "output.txt"

    with open(input, 'r', encoding='utf-8') as f:
        data = f.readlines()

    data = clean_data(data)
    save_data(data, output_path)

if __name__ == "__main__":
    main()