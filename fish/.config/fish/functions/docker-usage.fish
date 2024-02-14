function docker-usage
    set -l network_name $argv[1]

    if test -z "$network_name"
        echo "Usage: docker-usage <NETWORK_NAME>"
        return 1
    end

    set -l container_ids (docker network inspect $network_name -f '{{ range .Containers }}{{ .Name }} {{ end }}')

    if test -z "$container_ids"
        echo "No containers found on network $network_name"
        return 1
    end

    docker stats --no-stream --format "{{.Container}},{{.CPUPerc}},{{.MemUsage}}" (string split " " -- $container_ids) | awk -F, '{gsub(/%/, "", $2); gsub(/\/.*/, "", $3); sum1+=$2; sum2+=$3} END{print "CPU: " sum1 "%, MEM: " sum2 "MiB"}'
end
