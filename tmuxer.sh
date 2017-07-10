#!/bin/bash
TMUX="/usr/bin/tmux"
if [[ -z "$@" ]]; then echo -e "No arguments given.\nFormat:\t $0 sessionname ssh host1 [host2] [host3:[port]] [...]"; exit -1; fi
# tmux new-session -d 'ssh1
SESSION="$1"
GLANCE="bash /home/orbiter/pglances.sh"
CMD="$2"
declare -a HOSTLIST=( "$@" )
I=2
$TMUX new-session \; rename-session "$SESSION" \; detach \;

for host in "${HOSTLIST[@]:$I}"; do
        RL=$((I-2));
        printf "%s:: %s\n" "$RL" "$host"
        [[ -z "$host" ]] && break;
        if [[ "$(( ${#HOSTLIST[@]} - 3 ))" -gt "$RL" ]]; then
                $TMUX "select-pane" -t "$SESSION.$RL" \; split-window -v \; detach \;
        else
                $TMUX "kill-pane" -t "$SESSION.$(($RL+1))" \; detach \;
        fi
        $TMUX select-pane -t "$SESSION.0" \; select-layout tiled \; detach\;
        sleep .1;
        $TMUX attach -t "$SESSION" \; select-pane -t ".$RL" \; send-keys "ssh $host" Enter \; detach \;
        sleep .1;
        I=$(($I+1))
done

# attach to named
$TMUX a -t $SESSION

unset -v HOSTLIST
