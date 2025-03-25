#!/usr/bin/env zsh

# 出力先のファイルを保持する変数
outfile=""

# combined.md を行単位で読み込む
#   - IFS= で空行もそのまま取り込む
#   - read -r でバックスラッシュ等をエスケープ解釈しない
while IFS= read -r line; do

  # 区切り行かどうかを判定:
  #   1. 最低6文字以上あるか (例: [[[ ]]] → 6文字)
  #   2. 先頭3文字が '[[['
  #   3. 末尾3文字が ']]]'
  if [[ ${#line} -ge 6 && ${line:0:3} == '[[[' && ${line: -3} == ']]]' ]]; then
    # 先頭の [[[ と 末尾の ]]] を取り除いてファイル名を抽出

    # 方法1: 文字列切り取り（サブスクリプト）
    #   newfile="${line:3:${#line}-6}"
    #
    # 方法2: パターンマッチによる除去（こちらのほうがわかりやすいかも）
    newfile="${line#\[\[\[}"    # 先頭 '[[[' を削除
    newfile="${newfile%\]\]\]}" # 末尾 ']]]' を削除

    # ディレクトリが存在しなければ作成
    mkdir -p "${newfile:h}"

    # 以降の本文をこのファイルへ書き込む
    outfile="$newfile"

    # この行自体は本文としては出力しない
    continue
  fi

  # 区切り行でなければ、outfile が設定されている場合に追記
  if [[ -n "$outfile" ]]; then
    # 先頭がハイフンでもオプション解釈されないよう、print -- を使う
    print -- "$line" >> "$outfile"
  fi

done < combined_ja.md
