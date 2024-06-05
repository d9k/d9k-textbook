# TypeScript: Jupyter notebook

Jupyter notebook for experiments which can be easily saved and reproduced.

```bash
> sudo -H pip3 install --upgrade pip
> sudo -H pip3 install --root-user-action=ignore jupyterlab
> sudo -H pip3 show jupyterlab
> jupyter lab
> tslab install --python=python3  
Running python3 /home/d9k/.nvm/versions/node/v14.16.1/lib/node_modules/tslab/python/install.py --tslab=tslab
Installing TypeScript kernel spec
jupyter kernelspec list
> cd /path/to/desired/notebook/path
> sudo -H pip3 install notebook
> sudo -H pip3 install jupyter-console
> jupyter notebook
> jupyter console --kernel=tslab
```
