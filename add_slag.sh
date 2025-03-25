#!/usr/bin/env zsh

for file in content/blog/*.md; do
  # .md を外したファイル名を slug に
  slug=$(basename "$file" .md)

  # macOS/BSDのsedでは -i でインライン編集する際、後ろに拡張子を書くか、空文字を指定
  # ここではバックアップファイルを作らないよう "-i ''" を使っています
  sed -i '' "/^title = / a\\
slug = \"${slug}\"
" "$file"
done
