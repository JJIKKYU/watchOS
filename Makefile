USER_NAME = $(shell python3 Scripts/author_name.py)
CURRENT_DATE = $(shell pipenv run python Scripts/current_date.py)

# 사용법: make module name=모듈이름
module:
	@tuist scaffold Module \
	 --name ${name} \
	 --author "$(USER_NAME)" \
	 --current-date "$(CURRENT_DATE)"
	 
	@tuist edit