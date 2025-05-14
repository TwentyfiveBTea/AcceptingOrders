<template>
  <div class="page">
    <!-- 标题和返回主页链接 -->
    <div class="header">
      <h1>户型展示</h1>
      <router-link class="back-link" to="/">返回主页</router-link>
    </div>
    <!-- 轮播图 -->
    <div class="carousel">
      <div class="carousel-wrapper">
        <img :src="carouselImages[currentImage]" class="carousel-img" />
        <button class="carousel-btn left" @click="prevImage">&#8592;</button>
        <button class="carousel-btn right" @click="nextImage">&#8594;</button>
      </div>
      <div class="carousel-indicators">
        <span v-for="(img, idx) in carouselImages" :key="idx" :class="{active: idx === currentImage}" @click="goToImage(idx)"></span>
      </div>
    </div>
    <!-- 筛选栏 -->
    <div class="filters card">
      <label>排序方式：</label>
      <select v-model="sortType">
        <option value="default">默认排序</option>
        <option value="price">总价</option>
        <option value="area">面积</option>
      </select>
      <label>顺序：</label>
      <select v-model="sortOrder">
        <option value="asc">升序</option>
        <option value="desc">降序</option>
      </select>
      <label>区域：</label>
      <input v-model="regionKeyword" placeholder="输入区域关键词（如：鼓楼）" />
      <label>户型：</label>
      <select v-model="layoutType">
        <option value="">全部</option>
        <option value="1室">1室</option>
        <option value="2室">2室</option>
        <option value="3室">3室</option>
        <option value="4室">4室及以上</option>
      </select>
      <label>总价范围（万）：</label>
      <input v-model.number="minPrice" type="number" placeholder="最低" />
      -
      <input v-model.number="maxPrice" type="number" placeholder="最高" />
      <button class="search-btn" @click="onSearch">搜索</button>
    </div>
    <!-- 房源列表 -->
    <div class="card" style="margin:24px 0 10px 0;font-weight:bold;">
      房源列表（共{{ filteredHouses.length }}条）
    </div>
    <div class="card table-card">
      <table v-if="filteredHouses.length > 0">
        <thead>
          <tr>
            <th>id</th>
            <th>title</th>
            <th>region</th>
            <th>layout</th>
            <th>area</th>
            <th>direction</th>
            <th>decoration</th>
            <th>floor</th>
            <th>total_price</th>
            <th>unit_price</th>
            <th>follow_info</th>
            <th>tags</th>
            <th>link</th>
            <th>created_at</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="house in filteredHouses" :key="house.id">
            <td>{{ house.id }}</td>
            <td>{{ house.title }}</td>
            <td>{{ house.region }}</td>
            <td>{{ house.layout }}</td>
            <td>{{ house.area }}</td>
            <td>{{ house.direction }}</td>
            <td>{{ house.decoration }}</td>
            <td>{{ house.floor }}</td>
            <td>{{ house.total_price }}</td>
            <td>{{ house.unit_price }}</td>
            <td>{{ house.follow_info }}</td>
            <td>{{ house.tags }}</td>
            <td><a :href="house.link" target="_blank">链接</a></td>
            <td>{{ house.created_at }}</td>
          </tr>
        </tbody>
      </table>
      <div v-else class="no-data">暂无符合条件的房源数据</div>
    </div>
  </div>
</template>

<script>
import api from '@/api/index.js'
import home1 from '@/assets/home1.jpg'
import home2 from '@/assets/home2.jpg'
import home3 from '@/assets/home3.jpg'
import home4 from '@/assets/home4.jpg'
export default {
  name: 'HouseType',
  data() {
    return {
      houses: [],
      sortType: 'default',
      sortOrder: 'asc',
      regionKeyword: '',
      layoutType: '',
      minPrice: '',
      maxPrice: '',
      searchFlag: false,
      carouselImages: [home1, home2, home3, home4],
      currentImage: 0,
      carouselTimer: null
    }
  },
  computed: {
    filteredHouses() {
      let result = this.houses
      if (this.regionKeyword) {
        result = result.filter(h => h.region && h.region.includes(this.regionKeyword))
      }
      if (this.layoutType) {
        if (this.layoutType === '4室') {
          result = result.filter(h => h.layout && (h.layout.startsWith('4室') || h.layout.startsWith('5室') || h.layout.startsWith('6室')))
        } else {
          result = result.filter(h => h.layout && h.layout.startsWith(this.layoutType))
        }
      }
      if (this.minPrice) {
        result = result.filter(h => parseInt(h.total_price) >= this.minPrice)
      }
      if (this.maxPrice) {
        result = result.filter(h => parseInt(h.total_price) <= this.maxPrice)
      }
      if (this.sortType !== 'default') {
        result = result.slice().sort((a, b) => {
          let aVal, bVal
          if (this.sortType === 'price') {
            aVal = parseInt(a.total_price)
            bVal = parseInt(b.total_price)
          } else if (this.sortType === 'area') {
            aVal = parseFloat(a.area)
            bVal = parseFloat(b.area)
          }
          if (this.sortOrder === 'asc') return aVal - bVal
          else return bVal - aVal
        })
      }
      return result
    }
  },
  mounted() {
    api.getData().then(res => {
      this.houses = res.data
    })
    this.startCarousel()
  },
  beforeUnmount() {
    clearInterval(this.carouselTimer)
  },
  methods: {
    onSearch() {
      this.searchFlag = !this.searchFlag
    },
    startCarousel() {
      this.carouselTimer = setInterval(() => {
        this.nextImage()
      }, 3000)
    },
    nextImage() {
      this.currentImage = (this.currentImage + 1) % this.carouselImages.length
    },
    prevImage() {
      this.currentImage = (this.currentImage - 1 + this.carouselImages.length) % this.carouselImages.length
    },
    goToImage(idx) {
      this.currentImage = idx
    }
  }
}
</script>

<style scoped>
.page {
  padding: 24px 8vw 24px 8vw;
  background: #f7f8fa;
  min-height: 100vh;
}
.header {
  text-align: center;
  margin-bottom: 18px;
}
.header h1 {
  font-size: 2.2rem;
  font-weight: 700;
  margin: 0 0 8px 0;
  letter-spacing: 2px;
}
.back-link {
  display: inline-block;
  margin-bottom: 8px;
  color: #409eff;
  font-size: 1.1rem;
  text-decoration: none;
  transition: color 0.2s;
}
.back-link:hover {
  color: #1976d2;
  text-decoration: underline;
}
.card {
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0,0,0,0.07);
  padding: 18px 24px;
  margin-bottom: 18px;
}
.filters {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 12px;
  font-size: 15px;
  margin-bottom: 0;
}
.filters input, .filters select {
  margin: 0 8px 0 0;
  padding: 4px 8px;
  border-radius: 4px;
  border: 1px solid #d0d0d0;
  background: #fafbfc;
}
.search-btn {
  background: #409eff;
  color: #fff;
  border: none;
  border-radius: 4px;
  padding: 6px 18px;
  cursor: pointer;
  transition: background 0.2s;
}
.search-btn:hover {
  background: #1976d2;
}
.table-card {
  padding: 0;
}
table {
  width: 100%;
  background: #fff;
  border-collapse: separate;
  border-spacing: 0;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 1px 6px rgba(0,0,0,0.04);
}
th, td {
  padding: 10px 12px;
  text-align: left;
}
th {
  background: #f0f0f0;
}
tr:hover {
  background: #f5faff;
}
.no-data {
  color: #888;
  font-size: 16px;
  padding: 32px 0;
  text-align: center;
}
/* 轮播图样式 */
.carousel {
  width: 100%;
  max-width: 800px;
  margin: 0 auto 32px auto;
  position: relative;
}
.carousel-wrapper {
  position: relative;
  width: 100%;
  height: 260px;
  overflow: hidden;
  border-radius: 14px;
  box-shadow: 0 2px 12px rgba(0,0,0,0.09);
}
.carousel-img {
  width: 100%;
  height: 260px;
  object-fit: contain;
  background: #fff;
  display: block;
}
.carousel-btn {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: rgba(0,0,0,0.3);
  color: #fff;
  border: none;
  border-radius: 50%;
  width: 36px;
  height: 36px;
  font-size: 20px;
  cursor: pointer;
  z-index: 2;
  outline: none;
}
.carousel-btn.left {
  left: 12px;
}
.carousel-btn.right {
  right: 12px;
}
.carousel-indicators {
  position: absolute;
  left: 50%;
  bottom: 12px;
  transform: translateX(-50%);
  display: flex;
  gap: 8px;
}
.carousel-indicators span {
  display: block;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: #fff;
  opacity: 0.5;
  cursor: pointer;
  transition: opacity 0.2s;
}
.carousel-indicators .active {
  opacity: 1;
  background: #409eff;
}
</style>