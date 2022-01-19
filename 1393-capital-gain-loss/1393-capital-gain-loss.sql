# Write your MySQL query statement below
select
stock_name
,sum(sell_price+buy_price) as capital_gain_loss
from(
select
stock_name
,case when operation='Buy' then -price else 0 end as buy_price
,case when operation='Sell' then price else 0 end as sell_price
from
Stocks)as a
group by stock_name
