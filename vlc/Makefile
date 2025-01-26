vlc.json: vlc.yaml
	crazy-complete json vlc.yaml -o vlc.json

vlc.yaml: update_yaml.py vlc.from_help.yaml
	./update_yaml.py vlc.from_help.yaml vlc.yaml

vlc.from_help.yaml: vlc.help.txt
	crazy-complete --input-type=help yaml vlc.help.txt -o vlc.from_help.yaml

vlc.help.txt:
	vlc -H > vlc.help.txt

clean:
	rm -f vlc.help.txt vlc.from_help.yaml
