#!bash
# http://stevelosh.com/blog/2009/03/mercurial-bash-prompts/

hg_dirty() {
    hg status 2> /dev/null \
    | awk '$1 == "?" { print "?" } $1 != "?" { print "!" }' \
    | sort | uniq | head -c1
}

hg_branch() {
    hg branch 2> /dev/null
}
