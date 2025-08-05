$api_key        = ''
$api_url        = 'https://api.mod.io/v1'

$game_name      = $args[0]
$mod_name       = $args[1]

# Get Game ID
$data           = (Invoke-RestMethod -Method Get -Uri "${api_url}/games?api_key=${api_key}&_q=${game_name}").data
$data           = ($data) | select name,id  | where{$_.name -eq $game_name}
$data_game_name = ($data.name)
$game_id        = ($data.id)

$table          = @()
$table         += [pscustomobject]@{"Game Name" = $data_game_name; "ID" = $game_id}

$table | Format-Table

# Get exact mod name; e.g. ModCore would also list ModCore.*
$data           = (Invoke-RestMethod -Method get -uri "${api_url}/games/${game_id}/mods?api_key=${api_key}&_q=${mod_name}").data
$data           = ($data) | select name,id  | where{$_.name -eq $mod_name}
$data_mod_name  = ($data.name)
$mod_id         = ($data.id)

$table          = @()
$table         += [pscustomobject]@{"Mod Name" = $data_mod_name; "ID" = $mod_id}

$table | Format-Table

echo "Download:"
(Invoke-RestMethod -Method get -uri "${api_url}/games/${game_id}/mods/${mod_id}?api_key=${api_key}").modfile.download.binary_url
