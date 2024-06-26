<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue';
import { auth } from '@/middlewares/auth';
import { useAuthStore } from '@/stores/auth';
import { useCurrentUserStore } from '@/stores/currentUser';
import { useMessage, useNotification } from 'naive-ui';
import { useRouter } from 'vue-router';
import { getNotication } from '@/api/notification.api';

const user = useAuthStore();
const message = useMessage();
const router = useRouter();
const show = ref(false);
const isScrolled = ref(false);
const searchValue = ref('');
const currentU = useCurrentUserStore();
const notification = useNotification();
const loggedInRouters = ref([
  { label: 'Trang chủ', key: '/' },
  { label: 'Tạo bài viết', key: '/posts' },
  { label: 'Thông tin cá nhân', key: '/user-infor' },
  { label: 'Hồ sơ của bạn', key: '/profile-favorite' },
  { label: 'Đăng xuất', key: 'logout' }
]);

const loggedInRoutersDropdown = ref([
  { label: 'Thông tin cá nhân', key: '/user-infor' },
  { label: 'Hồ sơ của bạn', key: '/profile-favorite' },
  { label: 'Đăng xuất', key: 'logout' }
]);

const loggedInRoutersDropdownAdmin = ref([
  { label: 'Trang chủ admin', key: '/admin' },
  { label: 'Thông tin cá nhân', key: '/user-infor' },
  { label: 'Hồ sơ của bạn', key: '/profile-favorite' },
  { label: 'Đăng xuất', key: 'logout' }
]);

const loginRedirectRouters = ref([
  { label: 'Giới thiệu', key: '/introduce' },
  { label: 'Về chúng tôi', key: '/about-us' },
  { label: 'Liên hệ', key: '/contact' },
  { label: 'Đăng nhập', key: '/login' },
  { label: 'Đăng ký', key: '/sign-up' }
]);

const handleScroll = () => {
  isScrolled.value = window.scrollY >= 160;
};

onMounted(() => {
  window.addEventListener('scroll', handleScroll);
});

onBeforeUnmount(() => {
  window.removeEventListener('scroll', handleScroll);
});

const handleSearch = () => {
  if (searchValue.value.trim()) {
    localStorage.setItem('keyword', searchValue.value);
    const currentPath = router.currentRoute.value.fullPath;
    localStorage.setItem('previousPath', currentPath);
    router.push({ path: '/search', query: { q: searchValue.value } });
    searchValue.value = '';
  }
};

const goToPage = (key) => {
  if (key === 'logout') {
    user.clear();
    currentU.clear();
    message.success('Đăng xuất thành công!');
    router.push('/');
  } else {
    router.push(key);
  }
};
function formatDateTime(dateTimeString) {
  const date = new Date(dateTimeString);

  const options = {
    weekday: 'long',
    year: 'numeric',
    month: 'long',
    day: 'numeric',
    hour: 'numeric',
    minute: 'numeric',
    hour12: false,
    timeZone: 'Asia/Ho_Chi_Minh'
  };

  return date.toLocaleString('vi-VN', options);
}
const handleShowNotifications = async () => {
  try {
    const result = await getNotication();
    const resultReverse = result.reverse().slice(0, 5);
    resultReverse.forEach((noti) =>
      notification.info({
        title: 'Thông báo',
        content: noti.data,
        meta: formatDateTime(noti.createdAt),
        duration: 10000
      })
    );
  } catch (error) {
    message.error('Tải thông báo thất bại');
    console.log(error);
  }
};
</script>

<template>
  <div :class="{ header: true, container: true, 'header-shadow': isScrolled }">
    <div class="wide">
      <div style="display: flex; justify-content: center; align-items: center">
        <router-link to="/" class="header-logo">
          <IconBrandPinterest size="36" />
          <h2 v-if="!user.loggedIn">PixelPalette</h2>
        </router-link>
        <router-link class="btn-home" to="/" exact-active-class="active" v-if="user.loggedIn">
          <HfButton> Trang chủ </HfButton>
        </router-link>
        <router-link class="btn-home" to="/posts" exact-active-class="active" v-if="user.loggedIn">
          <HfButton> Tạo </HfButton>
        </router-link>
        <router-link
          class="btn-create-mobile"
          to="/posts"
          exact-active-class="active"
          v-if="user.loggedIn"
        >
          <HfButton> <IconPlus /> </HfButton>
        </router-link>
      </div>
      <div class="header-search" v-if="user.loggedIn">
        <IconSearch size="20px" @click="handleSearch" />
        <input
          type="text"
          v-model="searchValue"
          placeholder="Tìm kiếm..."
          @keyup.enter="handleSearch"
        />
      </div>
      <div class="btn-container" v-if="!user.loggedIn">
        <router-link class="header-link" to="/introduce" exact-active-class="active">
          Giới thiệu
        </router-link>
        <router-link class="header-link" to="/about-us" exact-active-class="active">
          Về chúng tôi
        </router-link>
        <router-link class="header-link" to="/contact" exact-active-class="active">
          Liên hệ
        </router-link>
        <router-link to="/login" exact-active-class="active">
          <HfButton class="btn-login"> Đăng nhập </HfButton>
        </router-link>
        <router-link to="/sign-up" exact-active-class="active">
          <HfButton class="btn-signup"> Đăng ký </HfButton>
        </router-link>
      </div>
      <IconMenu2
        size="28"
        class="mobile-menu-icon"
        @click="show = true"
        style="margin-left: 12px"
      />
      <n-drawer v-model:show="show" width="70%">
        <n-drawer-content closable>
          <template #header>
            <div style="display: flex; align-items: center">
              <IconBrandPinterest size="28" style="color: #e60023" />
              Menu
            </div>
          </template>
          <div class="mobile-menu">
            <div v-if="!user.loggedIn">
              <router-link
                v-for="option in loginRedirectRouters"
                :key="option.key"
                :to="option.key"
                exact-active-class="active"
              >
                <HfButton @click="show = false"> {{ option.label }} </HfButton>
              </router-link>
            </div>
            <div v-else>
              <router-link
                v-for="option in loggedInRouters"
                :key="option.key"
                :to="option.key === 'logout' ? '/' : option.key"
                :exact-active-class="option.key === 'logout' ? '' : 'active'"
              >
                <HfButton
                  @click="
                    () => {
                      show = false;
                      if (option.key === 'logout') user.clear();
                    }
                  "
                >
                  {{ option.label }}
                </HfButton>
              </router-link>
            </div>
          </div>
        </n-drawer-content>
      </n-drawer>
      <div class="menu-logined" v-if="user.loggedIn">
        <img
          src="@/assets/images/notification.png"
          alt="notification"
          title="notification"
          class="menu-logined-icon"
          @click="handleShowNotifications"
        />
        <img
          src="@/assets/images/messenger.png"
          alt="message"
          title="message"
          class="menu-logined-icon"
          @click="() => goToPage('/messages')"
        />
        <n-dropdown
          v-if="user.loggedIn"
          :options="
            currentU.currentUser.isAdmin ? loggedInRoutersDropdownAdmin : loggedInRoutersDropdown
          "
          show-arrow
          @select="goToPage"
        >
          <div
            style="
              display: flex;
              justify-content: space-between;
              align-items: center;
              cursor: pointer;
            "
            @click="() => goToPage('/profile-favorite')"
          >
            <img
              src="@/assets/images/user-avatar.png"
              alt="avatar"
              class="user-avatar"
              v-if="!currentU.currentUser.avatar"
            />
            <img :src="currentU.currentUser.avatar" alt="avatar" class="user-avatar" v-else />
            <IconChevronDown />
          </div>
        </n-dropdown>
      </div>
    </div>
  </div>
  <div class="cushion"></div>
</template>

<style lang="scss" scoped src="./HfHeader.scss"></style>
