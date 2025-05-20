def clean_data(data):
    # main関数のdataとは別物（ローカル変数）
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
    input_path = "input.txt"
    output_path = "output.txt"

    with open(input_path, 'r', encoding='utf-8') as f:
        data = f.readlines()  # これはmain内のdata

    data = clean_data(data)  # 別関数でも同じ変数名を使用して問題なし
    save_data(data, output_path)

if __name__ == "__main__":
    main()