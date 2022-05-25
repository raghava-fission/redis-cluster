import subprocess

def aws_create_redis_infra():
    terraform_cmd = subprocess.Popen("terraform apply --auto-approve", stdout=subprocess.PIPE, shell=True, cwd="terraform/environment/dev/")
    print(terraform_cmd.communicate())
    print("infra created")

def aws_destroy_redis_infra():
    terraform_cmd = subprocess.Popen("terraform destroy --auto-approve", stdout=subprocess.PIPE, shell=True, cwd="terraform/environment/dev/")
    print(terraform_cmd.communicate())
    print("infra destroyed")    

def ansible_deploy_cluster():
    ansbile_cmd = subprocess.Popen("ansible-playbook -i redis-host-inventory redis-cluster.yaml", stdout=subprocess.PIPE, shell=True)
    print(ansbile_cmd.communicate())
    print("cluster setup done")    

def main():
    print("Choose Option: 1) Create RedisInfra  2) Destroy Redis Infra  3)Create cluster on Existing Infra")
    c_action = input("Enter your choice...  ")
    if c_action == "1":
        aws_create_redis_infra()
    elif c_action == '2':
        aws_destroy_redis_infra()
    else:
        ansible_deploy_cluster()


exit(main())