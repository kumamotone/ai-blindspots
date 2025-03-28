
+++
title = "ステートレスなツールを使おう"
slug = "stateless-tools"
date = "2025-03-03T21:38:09-05:00"
tags = []
+++

ツールはステートレスであるべきです。つまり、各呼び出しが他の呼び出しから独立し、呼び出し間で考慮すべき状態が存在しないのが望ましいということです。  
残念ながら、シェルは非常によく使われるツールでありながら、ローカル状態（カレントディレクトリなど）を持ち込む厄介さがあります。Sonnet 3.7は「今どのディレクトリにいるのか」を把握するのがとても苦手です。できる限り、すべてのコマンドを単一ディレクトリから実行できるようにしておくのが理想です。

本当はモデルを「ステートを変化させるツールコールは避けるようにチューニング」できるといいのですが、まだ一般的ではありません。どうしても状態が必要な場合は、モデルに常に現在の状態を明示するか、または別の仕組みで管理させる必要があるでしょう。  
ロールプレイ(RP)系コミュニティにはこのあたりの知見が豊富だと思われます。

## 例

- TypeScriptプロジェクトが「common」「backend」「frontend」という3つのサブコンポーネントに分かれており、それぞれが独立したNPMモジュールでした。プロジェクトルートからCursorを起動すると、テストを実行するためにLLMは`cd`を行おうとするのですが、どのディレクトリにいるのかをうまく把握できずに混乱します。  
  そこでフロントエンドだけをワークスペースとして開いてCursorを使うと、カレントディレクトリを気にしなくて済むので、だいぶスムーズに動きました。

