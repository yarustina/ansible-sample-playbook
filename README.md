# ansible-sample-playbook 🐰

Приветик! Меня зовут Yarustina, здравствуйте. Я покажу тебе этот милый Ansible Playbook! 💖

## ✨ О чём это?
Это как волшебная книжечка, где спрятаны инструкции для автоматизации серверов:
- Тут есть папочки для `tasks`, `handlers`, `templates`, `vars` и даже `secrets`!
- Покажу, как хранить секретики (domain и список IP) в Ansible Vault или прямо в vars.
- Всё готово под твою инфраструктуру, осталось только добавить свои данные и запустить!

## 🔍 Что нужно?
- Ansible версии не младше 2.9 (я серьёзно!);
- Python от 3.6 или новее;
- Доступ к хостам по SSH (не забудь свои ключики/пароль!);
- Если будешь использовать Vault — файл с паролем или `--ask-vault-pass`.

## 📁 Структура проекта
```
.
├── handlers/       # слушатели событий (notify)
├── tasks/          # тут живёт основная магия плейбука
├── templates/      # Jinja2-шаблоны для конфигов
├── vars/           # переменные по умолчанию
│   └── main.yml    # место, куда можно прямо вписать свои domain и ipset_list
├── secrets/        # мой личный Vault (не даю пароль 🥲)
└── playbook.yml    # главный герой — твой playbook
```

## 🏡 Инвентарь
Я не знаю, какие у тебя сервера, поэтому **используй свой inventory**! 🌱
```bash
ansible-playbook \
  -i path/to/your/inventory \
  playbook.yml \
  --ask-vault-pass   # если будешь использовать Vault
```

## 🔐 Vault & Override
В папке `secrets/` лежит **мой** личный `vault.yml`, но пароль я не дам 🐥

**Вариант 1: Создать свой Vault**
```bash
cp secrets/vault.yml secrets/my_vault.yml
ansible-vault encrypt secrets/my_vault.yml
```
И запускать так:
```bash
ansible-playbook \
  -i inventory \
  playbook.yml \
  --vault-password-file ~/.vault_pass.txt
```

**Вариант 2: Прописать переменные в `vars/main.yml`**
```yaml
# vars/main.yml
# Вместо Vault просто запиши прямо здесь:

domain: example.com       # твой домен
ipset_list:               # список IP для ipset-листа
  - 192.168.1.10
  - 10.0.0.0/24
```
Так можно не использовать Vault вообще и всё равно быть в безопасности! 🔐

## 🚀 Как запустить?
1. Подготовь свой inventory.
2. Выбери: Vault или **vars/main.yml**.
3. Выполни:
   ```bash
   ansible-playbook \
     -i path/to/your/inventory \
     playbook.yml \
     --ask-vault-pass   # если выбрал свой Vault
   ```

## 🐾 Хочу помочь!
Присылай звёздочки! 🌟
