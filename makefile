APPID = oskude.plasmoid.cpubar
.PHONY: view test install upgrade uninstall restart refresh

view:
	qml plasmoid/contents/ui/main.qml

test:
	plasmoidviewer --applet plasmoid

install:
	kpackagetool5 -t Plasma/Applet -i plasmoid

upgrade:
	kpackagetool5 -t Plasma/Applet -u plasmoid

uninstall:
	kpackagetool5 -t Plasma/Applet -r $(APPID)

restart:
	kquitapp5 plasmashell; kstart5 plasmashell

refresh: upgrade restart
