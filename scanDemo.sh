echo "Scanning project files..."

repo=https://github.com/django/django.git
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-bandit-analysis.yml -e bandit_scan_dir="/home/undergrad/sonnacn/scanrepo" -e bandit_report_file="/home/undergrad/sonnacn/reports/bandit-django-report.html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)

echo "Scanning dependencies..."

repo=https://github.com/django/django.git
docker run --name owasp-jenkins -p 8443:8443 -v $(pwd):/home/undergrad/sonnacn/reports -it -d jayjohnson/owasp-jenkins:latest && docker exec -it owasp-jenkins git clone $repo /home/undergrad/sonnacn/scanrepo && docker exec -it owasp-jenkins ansible-playbook -i inventories/inventory_dev run-owasp-analysis.yml -e owasp_scan_dir="/home/undergrad/sonnacn/scanrepo" -e owasp_report_file="/home/undergrad/sonnacn/reports/owasp-django-report-$(date +'%Y-%m-%d-%H-%M-%S').html"
docker stop owasp-jenkins && docker rm owasp-jenkins
docker volume rm $(docker volume ls -f dangling=true -q)

echo "Cleaning up..."
docker network prune
docker system prune
docker volume rm $(docker volume ls -f dangling=true -q)
