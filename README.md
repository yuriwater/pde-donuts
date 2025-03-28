# 白黒キャラクター描画プログラム  

このプログラムは、Processing を使用して白黒のキャラクターを描画するものです。  
キャラクターの体の波模様や、ランダムな粒々の配置が特徴です。  

## プログラムの概要  

- **キャラクターのアニメーション**  
  - `move()` 関数により、上下に移動する動きを実装  
  - `changey` 変数を使って上下運動の状態を管理  

- **波模様の描画**  
  - `cos()` と `sin()` 関数を活用し、キャラクターの下部に独特な波模様を描画  
  - `w` と `wh` の値を調整することで、波の細かさや高さを変更可能  

- **ランダムな粒々の配置**  
  - `randomSeed(1)` により、常に同じ粒々の配置を再現  
  - `triangle()` を使い、小さな三角形をランダムな位置に配置  

- **脚と目の構造**  
  - `quad()` を使って、膝の関節と足を再現  
  - `arc()` を使用し、目を半円で表現  

## 使用技術  

- **Processing**: クリエイティブコーディング向けのプログラミング言語  
- **数学関数**: `cos()` や `sin()` を用いて幾何学的なパターンを生成  
- **アニメーション**: `changey` を変化させることで、キャラクターの上下運動を実現  

## 🚀 実行方法  

1. Processing をインストール  
2. Processing でコードを開き、実行ボタンを押す  

## 開発の工夫  

- **波模様の自然な描画**  
  - `sin()` の値を用いて、波の形が自然に見えるように調整  

- **上下運動の実装**  
  - `move()` 関数で、キャラクターが一定の範囲で自然に動くよう制御  

- **ランダムな要素の統一感**  
  - `randomSeed(1)` を使用し、常に同じ粒々の配置を再現  
