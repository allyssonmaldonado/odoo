FROM odoo:20.0

USER root

COPY custom_addons /mnt/extra-addons
COPY start.sh /start.sh

RUN sed -i 's/\r$//' /start.sh \
    && chmod +x /start.sh \
    && chown -R odoo:odoo /mnt/extra-addons

USER odoo

EXPOSE 10000

ENTRYPOINT ["/start.sh"]
