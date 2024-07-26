<script lang="ts">
  import type { PageData } from './$types';
  export let data : PageData;
  let {book} = data;
  let overlay = false;
  const openOverlay = () => {
    overlay = true;
  };
  const closeOverlay = () => {
    overlay = false;
  };
</script>

<a href="/">{"<-- Back Home"}</a>
<div class="pt-20">
  {#if book}
  <div  class={"fixed top-0 left-0 backdrop-blur-sm bg-black/50 z-50 w-full h-full p-8 flex flex-row " + (overlay ? "visible" : "invisible")}>
    <div class="flex flex-1 justify-center align-middle">
      <img class="w-96" src={book.coverImage} alt="cover"/>
    </div>
    <div>
      <button class="text-white" on:click={closeOverlay} on:keydown={closeOverlay}>X</button>
    </div>
  </div>
  <div class="flex justify-center">
    <div class="w-96 bg-slate-400 rounded-md p-3">
      <div class="flex justify-center">
        <img class="w-36" src={book.coverImage} alt={`${book.title} cover`} />
        <button class="text-white text-bold self-end" on:click={openOverlay}>[ expand ]</button>
      </div>
      <h1>{book.title}</h1>
      <h1>{book.description}</h1>
    </div>
  </div>
  <div class="flex justify-center">
    <div class="w-96 my-2 bg-blue-200 rounded-lg p-3">
      <h1>Amazon</h1>
      <a href="https://amazon.com">Link</a>
    </div>
  </div>
    {/if}

</div>