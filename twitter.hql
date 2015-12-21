

create table shbm(tweets_info STRING);

 LOAD DATA INPATH '/data/outputss.csv' OVERWRITE INTO TABLE shbm;

 insert overwrite table tts SELECT regexp_extract(tweets_info, '^(?:([^,]*)\,?){1}', 1) created_at,regexp_extract(tweets_info, '^(?:([^,]*)\,?){2}', 1) text,regexp_extract(tweets_info, '^(?:([^,]*)\,?){3}', 1) id,regexp_extract(tweets_info, '^(?:([^,]*)\,?){4}', 1) retweet_count,regexp_extract(tweets_info, '^(?:([^,]*)\,?){5}', 1) favorite_count  from shbm;

select text from tts where retweet_count/favorite_count>1;

 select max(retweet_count) from tts group by created_at;

 select id,text from tts order by retweet_count;

 select id,text from tts order by favorite_count;



