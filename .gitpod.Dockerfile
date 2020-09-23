# athrill コピー元イメージ
FROM mikoto2000/athrill:rh850f1x-latest AS athrill
RUN chown root:root /usr/local/bin/athrill2 /usr/local/bin/athrill-run
RUN chown -R root:root /opt/athrill

# カーネルビルド環境構築済みイメージ
FROM gitpod/workspace-full

# athrill バイナリコピー元イメージからバイナリをコピー
COPY --from=athrill --chown=root:root \
        /usr/local/bin/athrill2 \
        /usr/local/bin
COPY --from=athrill --chown=root:root \
        /usr/local/bin/athrill-run \
        /usr/local/bin

# athrill コピー元イメージからサンプル設定ファイルをコピー
COPY --from=athrill --chown=root:root \
        /opt/athrill \
        /opt/athrill

