'use strict';
angular.module('app.xyqmenpai', [])

.controller('itemCtrl', [
  '$scope', '$interval', '$window'
  ($scope, $interval, $window) ->
    level = []
    for x in [0..15]
      level[x] = x

    $scope.opt =
      level: level
      edit: false
      mp: ['天宫','龙宫','神木林','五庄观','盘丝岭','无底洞','凌波城','阴曹地府','天机城','花果山','女魃墓']

    $scope.edit = ->
      $scope.opt.edit = true

    $scope.save = ->
      $scope.opt.edit = false
      localStorage.setItem('item',  JSON.stringify($scope.item))

    $scope.fly = (id) ->
      for k in $scope.item
        if k.id == id then k.fly = Date.parse( new Date())
      localStorage.setItem('item',  JSON.stringify($scope.item))

    setItem = (id) ->
      item_1 = [
        {
          id: 0
          name: '成员1'
          local: '神木林'
          level: 15
          fly: 0
          over: 0
        }
        {
          id: 1
          name: '成员2'
          local: '无底洞'
          level: 15
          fly: 0
          over: 0
        }

        {
          id: 2
          name: '成员3'
          local: '龙宫'
          level: 15
          fly: 0
          over: 0
        }

        {
          id: 3
          name: '成员4'
          local: '天宫'
          level: 15
          fly: 0
          over: 0
        }

        {
          id: 4
          name: '成员5'
          local: '凌波城'
          level: 15
          fly: 0
          over: 0
        }
      ]

      item_2 = [
        {
          id: 0
          name: '成员1'
          local: '五庄观'
          level: 15
          fly: 0
          over: 0
        }
        {
          id: 1
          name: '成员2'
          local: '盘丝岭'
          level: 15
          fly: 0
          over: 0
        }

        {
          id: 2
          name: '成员3'
          local: '天宫'
          level: 15
          fly: 0
          over: 0
        }

        {
          id: 3
          name: '成员4'
          local: '无底洞'
          level: 15
          fly: 0
          over: 0
        }
        {
          id: 4
          name: '成员5'
          local: '神木林'
          level: 15
          fly: 0
          over: 0
        }
      ]
      $scope.item = eval( 'item_' + id)
      localStorage.setItem('item', JSON.stringify($scope.item) )

    $scope.setItem = (id) ->
      msg = confirm("将会清除现有配置！")
      if msg then setItem(id)

    item = localStorage.getItem('item', $scope.item)

    if item
      item = JSON.parse(item)
      $scope.item = item
    else
      setItem(1)

    fn = ->
      $scope.time = Date.parse( new Date())
      for k in $scope.item
        if (k.fly + (60 * 60 * 1000 - k.level * 120 * 1000)) <= $scope.time
          k.over = 0
        else
          k.over = (60 * 60 * 1000 - k.level * 120 * 1000) - ($scope.time - k.fly)

    $interval(fn , 1000);
])
