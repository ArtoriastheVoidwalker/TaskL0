create table deliveries (
                            id      serial primary key,
                            name     varchar(255) not null,
                            phone    varchar(255) not null,
                            zip      varchar(255) not null,
                            city     varchar(255) not null,
                            address  varchar(255) not null,
                            region   varchar(255) not null,
                            email    varchar(255) not null
);

create table orders (
                        order_uid           varchar(255) primary key,
                        track_number        varchar(255)     not null unique,
                        entry               varchar(255) not null,
                        locale              varchar(255) not null,
                        delivery_id        int         not null references deliveries (id),
                        internal_signature  varchar(255)     not null,
                        customer_id         varchar(255)     not null,
                        delivery_service    varchar(255)     not null,
                        shardkey            varchar(255)     not null,
                        sm_id              int    not null,
                        date_created       timestamp   not null,
                        oof_shard           varchar(255)     not null
);

create table payments (
                          transaction    varchar(255) primary key references orders (order_uid),
                          request_id     varchar(255) not null,
                          currency       varchar(255) not null,
                          provider       varchar(255) not null,
                          amount        int     not null,
                          payment_dt    int     not null,
                          bank           varchar(255) not null,
                          delivery_cost int     not null,
                          goods_total   int     not null,
                          custom_fee    int     not null
);

create table items (
                       rid           varchar(255) primary key,
                       chrt_id      int     not null,
                       track_number  varchar(255) not null references orders (track_number),
                       price        int     not null,
                       name          varchar(255) not null,
                       sale         int     not null,
                       size          varchar(255) not null,
                       total_price  int     not null,
                       nm_id        int     not null,
                       brand        varchar(255) not null,
                       status       int     not null
);