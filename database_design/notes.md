#### Indexes

Tables:

Table users:
  * id (primary key index)
  * email (unique index)

Table user_roles:
  * id (primary key index)
  * (user_id, role_id) (index)

Table models:
  * id (primary key index)
  * (manufacturer_id, name) (index)
  * name (unique index)

Table products:
  * id (primary key index)
  * (user_id, data_memory_model_id) (index)
  * price (index)
  * data_memory_model_id (index)
  * user_id (index)

Table manufacturers:
  * id (primary key index)
  * (name) (unique index)

Table data_memory_models:
  * id (primary key index)
  * (model_id, data_memory_id) (index)

Table roles:
  * id (primary key index)
  * level (unique index)

Table data_memories:
  * id (primary key index)
  * size (unique index)
