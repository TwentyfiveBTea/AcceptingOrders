<template>
  <div class="home-container">
    <h1>欢迎来到主页</h1>
    <div class="button-grid">
      <router-link to="/CollectPage" class="nav-button">
        <button>页面一</button>
      </router-link>
      <button @click="navigateTo('HouseResource')" class="nav-button">页面二</button>
      <router-link :to="{ name: 'HouseType' }" class="nav-button">
        <button>页面三</button>
      </router-link>
      <button @click="$router.push('/PriceChange')" class="nav-button">页面四</button>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    navigateTo(routeName) {
      this.$router.push({ name: routeName })
    }
  }
}
</script>

<style src="@/assets/css/home.css"></style>