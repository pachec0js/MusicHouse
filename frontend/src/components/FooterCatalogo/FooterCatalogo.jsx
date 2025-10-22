export default function FooterCatalogo() {

    return (
        <>
            <footer className="bg-[#780000] shadow-sm dark:bg-white">
                <div className="w-full mx-auto max-w-screen-xl p-6 md:flex md:items-center md:justify-between">
                    <span className="text-sm text-white sm:text-center dark:text-white">
                        © 2025{" "}
                        <a href="https://flowbite.com/" className="hover:underline">
                            Music House™
                        </a>
                        . All Rights Reserved.
                    </span>
                    <ul className="flex flex-wrap items-center mt-3 text-sm font-medium text-white dark:text-gray-400 sm:mt-0">
                        <li>
                            <a href="#" className="hover:underline me-4 md:me-6">
                                Cordas
                            </a>
                        </li>
                        <li>
                            <a href="#" className="hover:underline me-4 md:me-6">
                                Sopro
                            </a>
                        </li>
                        <li>
                            <a href="#" className="hover:underline me-4 md:me-6">
                                Teclas
                            </a>
                        </li>
                        <li>
                            <a href="#" className="hover:underline me-4 md:me-6">
                                Percussão
                            </a>
                        </li>
                        <li>
                            <a href="#" className="hover:underline me-4 md:me-6">
                                Foles
                            </a>
                        </li>
                        <li>
                            <a href="#" className="hover:underline me-4 md:me-6">
                                Equipamentos de áudio
                            </a>
                        </li>
                        <li>
                            <a href="#" className="hover:underline">
                                Acessórios
                            </a>
                        </li>
                    </ul>
                </div>
            </footer>

        </>

    );
}

