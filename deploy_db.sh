# The following variables are defined in ~/.bashrc
# SNOWFLAKE_ACCOUNT
# SNOWFLAKE_USER
# SNOWFLAKE_PASSWORD
# SNOWFLAKE_ROLE

snowddl-singledb -c jaffle_shop_db -w compute_wh --config-db raw --target-db raw --apply-unsafe apply