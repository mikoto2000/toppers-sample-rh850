# athrill コピー元イメージ
FROM mikoto2000/athrill:rh850f1x-latest AS athrill

# カーネルビルド環境構築済みイメージ
FROM gitpod/workspace-full

# athrill バイナリコピー元イメージからバイナリをコピー
COPY --from=athrill \
        /usr/local/bin/athrill2 \
        /usr/local/bin
COPY --from=athrill \
        /usr/local/bin/athrill-run \
        /usr/local/bin

# athrill コピー元イメージからサンプル設定ファイルをコピー
COPY --from=athrill \
        /opt/athrill \
        /opt/athrill

