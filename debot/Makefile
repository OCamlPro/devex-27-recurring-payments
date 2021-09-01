all:
	$(MAKE) -C ..

deploy:
	ft contract deploy RPSDebot --create debot_RPS -f
	ft call debot_RPS setABI '{ "dabi": "%{hex:read:contract:abi:RPSDebot}" }'
	ft call debot_RPS setIcon '{ "icon": "%{hex:string:data:image/png;base64,%{base64:file:RPSDebot.png}}" }'

run:
	ft client -- debot fetch %{account:address:debot_RPS} --keypair '%{account:keypair:user1}'

invoke:
	ft client -- debot invoke %{account:address:debot_RPS} '%{account:in-message:debot_RPS:0:other_entry:{ "x": 3 \}}'
