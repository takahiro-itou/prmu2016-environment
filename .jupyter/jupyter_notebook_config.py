
c = get_config()

# 全ての IP から接続を許可
c.NotebookApp.ip = '*'
c.NotebookApp.password = u'sha1:23b3d03f153b:ce55dfde0c736b3555c82cc6abede268d731647e'

c.NotebookApp.open_browser = False
c.NotebookApp.port = 25

