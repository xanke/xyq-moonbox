(function() {
  'use strict';
  angular.module('app.xyqmenpai', []).controller('itemCtrl', [
    '$scope', '$interval', '$window', function($scope, $interval, $window) {
      var fn, i, item, level, setItem, x;
      level = [];
      for (x = i = 0; i <= 15; x = ++i) {
        level[x] = x;
      }
      $scope.opt = {
        level: level,
        edit: false,
        mp: ['天宫', '龙宫', '神木林', '五庄观', '盘丝岭', '无底洞', '凌波城', '阴曹地府', '天机城', '花果山', '女魃墓']
      };
      $scope.edit = function() {
        return $scope.opt.edit = true;
      };
      $scope.save = function() {
        $scope.opt.edit = false;
        return localStorage.setItem('item', JSON.stringify($scope.item));
      };
      $scope.fly = function(id) {
        var j, k, len, ref;
        ref = $scope.item;
        for (j = 0, len = ref.length; j < len; j++) {
          k = ref[j];
          if (k.id === id) {
            k.fly = Date.parse(new Date());
          }
        }
        return localStorage.setItem('item', JSON.stringify($scope.item));
      };
      setItem = function(id) {
        var item_1, item_2;
        item_1 = [
          {
            id: 0,
            name: '成员1',
            local: '神木林',
            level: 15,
            fly: 0,
            over: 0
          }, {
            id: 1,
            name: '成员2',
            local: '无底洞',
            level: 15,
            fly: 0,
            over: 0
          }, {
            id: 2,
            name: '成员3',
            local: '龙宫',
            level: 15,
            fly: 0,
            over: 0
          }, {
            id: 3,
            name: '成员4',
            local: '天宫',
            level: 15,
            fly: 0,
            over: 0
          }, {
            id: 4,
            name: '成员5',
            local: '凌波城',
            level: 15,
            fly: 0,
            over: 0
          }
        ];
        item_2 = [
          {
            id: 0,
            name: '成员1',
            local: '五庄观',
            level: 15,
            fly: 0,
            over: 0
          }, {
            id: 1,
            name: '成员2',
            local: '盘丝岭',
            level: 15,
            fly: 0,
            over: 0
          }, {
            id: 2,
            name: '成员3',
            local: '天宫',
            level: 15,
            fly: 0,
            over: 0
          }, {
            id: 3,
            name: '成员4',
            local: '无底洞',
            level: 15,
            fly: 0,
            over: 0
          }, {
            id: 4,
            name: '成员5',
            local: '神木林',
            level: 15,
            fly: 0,
            over: 0
          }
        ];
        $scope.item = eval('item_' + id);
        return localStorage.setItem('item', JSON.stringify($scope.item));
      };
      $scope.setItem = function(id) {
        var msg;
        msg = confirm("将会清除现有配置！");
        if (msg) {
          return setItem(id);
        }
      };
      item = localStorage.getItem('item', $scope.item);
      if (item) {
        item = JSON.parse(item);
        $scope.item = item;
      } else {
        setItem(1);
      }
      fn = function() {
        var j, k, len, ref, results;
        $scope.time = Date.parse(new Date());
        ref = $scope.item;
        results = [];
        for (j = 0, len = ref.length; j < len; j++) {
          k = ref[j];
          if ((k.fly + (60 * 60 * 1000 - k.level * 120 * 1000)) <= $scope.time) {
            results.push(k.over = 0);
          } else {
            results.push(k.over = (60 * 60 * 1000 - k.level * 120 * 1000) - ($scope.time - k.fly));
          }
        }
        return results;
      };
      return $interval(fn, 1000);
    }
  ]);

}).call(this);
