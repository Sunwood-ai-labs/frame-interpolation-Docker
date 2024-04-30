
<p align="center">
<img src="https://github.com/Sunwood-ai-labs/frame-interpolation-Docker/blob/master/docs/icon/FILM_icon2.gif?raw=true" width="100%">
<br>
<h1 align="center">FILM Docker</h1>
<h2 align="center">
  ～frame interpolation～

## 概要

FILM Dockerは、Google ResearchのFILM (Frame Interpolation for Large Scene Motion)を使って、動画の任意のフレーム間に新しいフレームを補間するDockerイメージです。 
補間により滑らかでよりフレームレートの高い動画を生成できます。

## 準備

1. このリポジトリをクローンします
   ```
   git clone https://github.com/Sunwood-ai-labs/frame-interpolation-Docker.git
   ```

2. pretrained_models フォルダに `film_net` と `vgg` をダウンロードします
   - ダウンロードリンク: [frame-interpolation's GDrive](https://drive.google.com/drive/folders/1q8110-qp225asX3DQvZnfLfJPkCHmDpy)
   - ダウンロードした圧縮ファイルを解凍し、pretrained_modelsフォルダに配置します

3. Docker、Docker Composeをインストールします
   - Docker: https://docs.docker.com/get-docker/
   - Docker Compose: https://docs.docker.com/compose/install/

## 使い方 

1. photos フォルダに補間したい連番画像を配置します

2. Dockerイメージをビルドし、コンテナを起動します
   ```
   docker-compose run app /bin/bash  
   ```

3. 以下のコマンドでフレーム補間を実行します
   ```
   python3 -m eval.interpolator_cli \
      --pattern "photos/example03" \
      --model_path pretrained_models/film_net/Style/saved_model \
      --times_to_interpolate 5 \
      --output_video
   ```
   - `--pattern`: 入力画像のパスパターン
   - `--model_path`: 使用するモデルのパス 
   - `--times_to_interpolate`: 補間するフレーム数
   - `--output_video`: 補間した画像から動画を生成

4. 補間結果は photosフォルダ内のinterpolated_frames フォルダと interpolated.mp4 ファイルに出力されます

## ヒント
- photos, pretrained_models フォルダはDockerコンテナにマウントされているので、ホストPCから簡単にファイルのやり取りができます
- より詳しい使い方は[frame-interpolation](https://github.com/google-research/frame-interpolation)を参照してください

## 参考文献
- [FILM: Frame Interpolation for Large Motion (CVPR 2022)](https://film-net.github.io/)
