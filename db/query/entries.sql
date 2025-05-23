-- name: CreateEntries :one
INSERT INTO entries(
    account_id,
    ammount
) VALUES (
    $1, $2
) RETURNING *;

-- name: GetEntries :one
SELECT * FROM entries
WHERE id = $1 LIMIT 1;

-- name: ListEntries :many
SELECT * FROM entries
ORDER BY id 
LIMIT $1 
OFFSET $2;

-- name: UpdateEntries :one
UPDATE entries
SET ammount = $2
WHERE id = $1
RETURNING *;

-- name: DeleteEntries :exec
DELETE FROM entries WHERE id = $1;


