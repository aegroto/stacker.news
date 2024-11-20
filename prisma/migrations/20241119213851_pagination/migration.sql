CREATE OR REPLACE FUNCTION paginated_item_comments(item_id INT)
  RETURNS table ("text" text, "path" text)
  LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE
BEGIN ATOMIC
    SELECT "text", "path"
    FROM "Item"
    WHERE CAST("Item"."path" as text) LIKE item_id || '.%';
END;
