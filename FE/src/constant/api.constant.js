export const ApiConstant = {
  auth: {
    login: 'Accounts/signIn',
    register: 'Accounts/signUp',
    changePassword: 'Accounts/changePassword',
    forgotPassword: 'forgot'
  },
  post: {
    postAll: 'Posts/getAll',
    createPost: 'Posts/create',
    postById: 'Posts/getById',
    postByUserId: 'Posts/getByUserId',
    deletePostById: 'Posts/delete',
    updatePostById: 'Posts/update',
    getByCollectionId: 'Posts/getByCollectionId',
    toggleLike: 'Posts/toggleLike',
    checkLike: 'Posts/checkLike',
    search: 'search'
  },
  user: {
    currentUser: 'Users/getLoginUser',
    changeAvatar: 'Users/avatar',
    changeInfor: 'Users/profile',
    deleteAccount: 'Users/delete',
    getUserById: 'Users/getById',
    followUser: 'Follow/follower',
    unFollowUser: 'Follow/unfollower',
    checkFollow: 'Follow/checkFollower',
    getAll: 'Users/getAll',
    userUpdate: 'Users/update',
    searchUser: 'search-user'
  },
  collection: {
    collectionAll: 'Posts/getAll',
    createCollection: 'Collections/create',
    getCollectionByUserId: 'Collections/getByUserId',
    getCollectionByPostId: 'Collections/getByPostId',
    savePost: 'Posts/toggleCollection',
    getById: 'Collections/getById',
    updateBackgound: 'Collections/background',
    updateCollection: 'Collections/update',
    deleteCollection: 'Collections/delete',
    checkSaveCollection: 'Collections/checkOwnCollection'
  },
  admin: {
    checkAdmin: 'Admin/GetRole'
  },
  analysises: {
    getNotification: 'Analysises/getNotifications',
    deleteNotification: 'Analysises/deleteNotification',
    createNotification: 'Analysises/createNotification',
    getAnalysises: 'Analysises/getAnalysisToday'
  },
  account: {
    getAllAccount: 'Admin/GetAllRoles',
    editAccount: 'Admin/EditRole'
  },
  comment: {
    getCommentByPostId: 'get-comment',
    create: 'comments',
    delete: 'del-comment',
    update: 'edit-comment'
  },
  chat: {
    getConversation: 'get-conversation',
    createConversation: 'create-chat',
    getMessageById: 'get-message',
    sendMessages: 'send-message'
  }
};
