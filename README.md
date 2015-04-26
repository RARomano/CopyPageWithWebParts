# CopyPageWithWebParts
Como copiar uma página mantendo todas as WebParts


## Passo 1:  Clone ou faça o download do repositório

Digite o comando abaixo no Shell:

`git clone https://github.com/RARomano/CopyPageWithWebParts.git`

## Passo 2: Execute o script no PowerShell

Esse script recebe 4 parâmetros de entrada:
- Url - Url do Site onde a página que será copiada se encontra
- ServiceName - Url relativa do subsite
- SourcePage - Página de origem
- DestPage - Página que será criada com todas as webparts da página de origem


```PowerShell
.\clonePageWithParts.ps1 -Url http://site/subsite -ServiceName /subsite -SourcePage "Pages/default.aspx" -DestPage "Pages/newpage.aspx"
```
