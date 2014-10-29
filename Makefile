PROJECT = gut

DEPS = ibrowse jsx jsxn mixer sync getopt colorerl thorerl
dep_ibrowse = git https://github.com/cmullaparthi/ibrowse.git master
dep_jsx = git https://github.com/talentdeficit/jsx.git
dep_jsxn = git https://github.com/talentdeficit/jsxn.git master
dep_mixer = git https://github.com/opscode/mixer.git master
dep_sync = git https://github.com/rustyio/sync.git master
dep_getopt = git https://github.com/jcomellas/getopt v0.8.2
dep_colorerl = git git@github.com:unbalancedparentheses/colorerl.git master
dep_thorerl = git git@github.com:unbalancedparentheses/thorerl.git master

include erlang.mk

SHELL_OPTS = -name ${PROJECT}@`hostname` -s ${PROJECT} -s sync

escriptize: app
	erl -pa ebin/ -pa deps/*/ebin/ -s gut_escriptize run -s init stop -noshell

publish: escriptize
	bin/gut find
	git add bin/gut
	git commit -m "updated gut binary"
	git push origin master
