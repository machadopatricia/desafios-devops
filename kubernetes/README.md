# Desafio 02 - Kubernetes
Ver [Kubernetes](https://github.com/idwall/desafios-devops/tree/master/kubernetes)

## Como utilizar a solução
- A [imagem] (https://hub.docker.com/repository/docker/machadopatricia/idapp/general) (pública) já consta no Dockerhub e nos values.yaml.
- Os values estão preenchidos de forma em que nada precisa ser alterado, portanto, é necessário somente navegar até o diretório base (Kubernetes) e rodar:
```
kubectl apply -f .
```

- Na raiz do repositório, encontra-se o arquivo *deploy.sh*. Basta rodar esse script para que o namespace seja criado (padrao idapp) e os recursos dos manifestos sejam criados nele.
```
chmod +x .deploy.sh
./deploy.sh
```

- No entanto, como a aplicação deve ser acessada através de http://localhost:3000, pode-se fazer necessário o port-forwarding, pois o Service não disponibiliza essa porta como padrão. Quando estiver no contexto kubectl da aplicação idapp (caso o namespace se mantenha esse nos values), basta executar o comando abaixo:
```
kubectl port-forward service/idapp 3000:80 -n idapp
```

- Dessa forma, você vai conseguir acessar aplicação pelo navegador via http://localhost:3000

- A aplicação utiliza health checks, como liveness e readiness, que ajudam na disponibilidade. Os recursos se concentram todos no namespace *idapp* para uma melhor rastreabilidade e, consequentemente, melhor troubleshooting da aplicação.
