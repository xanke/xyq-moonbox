'use strict';

angular.module('app.xyqmenpai', [])

.controller('itemCtrl', [
  '$scope', '$interval'
  ($scope, $interval) ->
    console.log 'sd'

    $scope.fly = (id) ->



      for k in $scope.item
        if k.id == id then k.fly = Date.parse( new Date())


      console.log $scope.item

    time = 0


    item = [
      {
        id: 0
        name: '队友1'
        local: '神木林'
        level: 15
        fly: 0
      }

      {
        id: 1
        name: '队友2'
        local: '无底洞'
        level: 15
        fly: 0
      }

      {
        id: 2
        name: '队友3'
        local: '龙宫'
        level: 12
        fly: 0
      }

      {
        id: 3
        name: '队友4'
        local: '天宫'
        level: 5
        fly: 0
      }

      {
        id: 4
        name: '队友5'
        local: '凌波城'
        level: 12
        fly: 0
      }


    ]

    $scope.item = item


    fn = ->


      $scope.time = Date.parse( new Date())

    $interval(fn , 1000);



])
