# How to use the extended postges container

1. Set up your credentials in AWS SSM paramater store with the following pattern: `/environment/service/POSTGRES_USER` & `/environment/service/POSTGRES_PASSWORD` 

2. Pass in aws credentials and run the  container like so: 

```bash
docker run -d \                                
-e SERVICE="<service>" \
-e ENVIRONMENT="<environment>" \
-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
-e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
-e AWS_SESSION_TOKEN=${AWS_SESSION_TOKEN} \ 
-e REGION="<region>" \
-p 5432:5432 --name <container_name> postgresSecrets
```

3. Exec int container and login to DB: `docker exec -it <conatainer_name> bash` 