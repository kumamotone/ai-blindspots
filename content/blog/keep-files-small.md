
+++
title = "ファイルを小さく保つ"
slug = "keep-files-small"
date = "2025-03-04T10:17:02-05:00"
tags = []
+++

コードファイルがどの程度大きいと「大きすぎる」と言えるかは、長年議論の的です。単一責任の原則に則って「クラス1つにつきファイル1つ」という人もいれば、状況によっては大きいファイルも容認できる、と考える人もいます。

しかし、RAG（Retrieval-Augmented Generation）システムがファイル単位でしかコードコンテキストを提供できないとしたら、巨大ファイルを扱うのはコンテキストを圧迫してしまいます。またCursorのようなIDEでは、LLMが生成したパッチを適用するときに失敗するケースや、仮に適用できたとしても処理が非常に遅くなる可能性があります（たとえばCursor 0.45.17では、64KBのファイルに55箇所の編集を適用するだけでもかなり時間がかかります）。さらに、128KBを超えると、Sonnet 3.7（200kトークンのコンテキストウィンドウしかない）にファイル全体の修正をさせるのは困難になります。

また、ファイルを小さく分割する作業の手間も、LLMがインポートの調整などをやってくれるのでそこまで大きくありません。

## 例

- 471KBものPythonファイルの中から、小さなテストクラスを別ファイルに移動してほしいとSonnet 3.7に依頼しました。編集自体は些細なはずでしたが、Sonnet 3.7はCursorのパッチ適用機能が正しく扱えるかたちで提案できず、結局上手くいきませんでした。

