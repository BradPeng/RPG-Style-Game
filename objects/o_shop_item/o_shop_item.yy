{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "o_shop_item",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":4,"eventType":7,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":2,"eventType":3,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"p_entity","path":"objects/p_entity/p_entity.yy",},"propertyId":{"name":"entityShadow","path":"objects/p_entity/p_entity.yy",},"value":"False",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"o_solid","path":"objects/o_solid/o_solid.yy",},"propertyId":{"name":"isSolid","path":"objects/o_solid/o_solid.yy",},"value":"False",},
  ],
  "parent": {
    "name": "Items",
    "path": "folders/Objects/Entities/Items.yy",
  },
  "parentObjectId": {
    "name": "p_entity",
    "path": "objects/p_entity/p_entity.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"item","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"ITEM.BOMB","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"itemCost","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"itemAmount","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "s_item_ui",
    "path": "sprites/s_item_ui/s_item_ui.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}